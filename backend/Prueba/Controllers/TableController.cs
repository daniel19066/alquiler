using Microsoft.AspNetCore.Mvc;
using MySqlConnector;
using System.Data.Common;

namespace Prueba.Controllers;

[ApiController]
[Route("[controller]")]
public class TableController : ControllerBase
{

    private readonly ILogger<TableController> _logger;
    private readonly MySqlDataSource ds; 

    public TableController(ILogger<TableController> logger,MySqlDataSource dataSource)
    {
        _logger = logger;
        ds = dataSource;
    }


    [HttpGet(Name = "Table")]
    public async Task<IReadOnlyList<Table>> get()
    {
        using var connection = await ds.OpenConnectionAsync();
        using var command = connection.CreateCommand();
        command.CommandText = "SELECT Cedula, Nombre, Fecha AS \"Fecha Alquiler\",tiempo AS \"Tiempo Alquilado\", Saldo, Placa, Marca  FROM Alquiler JOIN Carro ON Carro.Carroid=Alquiler.Carroid  JOIN Cliente ON Alquiler.Clienteid = Cliente.Clienteid;";
        return await ReadAllAsync(await command.ExecuteReaderAsync());
    }

    private async Task<IReadOnlyList<Table>> ReadAllAsync(DbDataReader reader)
    {
        var posts = new List<Table>();
        using (reader)
        {
            while (await reader.ReadAsync())
            {
                var post = new Table
                {
                    Cedula = reader.GetString(0),
                    Nombre = reader.GetString(1),
                    Fecha = reader.GetDateTime(2),
                    Tiempo = reader.GetInt32(3),
                    Saldo = reader.GetInt32(4),
                    Placa = reader.GetString(5),
                    Marca = reader.GetString(6),
                };
                posts.Add(post);
            }
        }
        return posts;
    }
}