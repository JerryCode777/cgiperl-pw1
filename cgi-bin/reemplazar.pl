#!/usr/bin/perl -w
use strict;
use warnings;
use CGI;
use utf8;
use Encode qw(decode encode);

my $q = CGI->new;

# Obtenemos los valores enviados por el formulario y asegurarse de que se decodifiquen como UTF-8
my $paragraph = decode('UTF-8', $q->param('paragraph') || '');
my $search = decode('UTF-8', $q->param('search') || '');
my $replace = decode('UTF-8', $q->param('replace') || '');

# Reemplazamos la palabra buscada por la palabra de reemplazo
my $modified_paragraph = $paragraph;
my $is_replaced = 0;

if ($search ne '' && $replace ne '') {
    $modified_paragraph =~ s/\b\Q$search\E\b/$replace/g;
    $is_replaced = 1;  
}

# Generar la respuesta HTML
print $q->header('text/html; charset=UTF-8');  
print "<!DOCTYPE html>";
print "<html lang=\"es\">";
print "<head>";
print "<title>Buscar y Reemplazar</title>";
print "<meta charset=\"UTF-8\">";
print "<link rel=\"stylesheet\" href=\"../css/mystyle.css\">";
print "</head>";
print "<body>";

print "<div class=\"header\">";
print "<h2>Laboratorio: Buscar y Reemplazar Palabras</h2>";
print "<p class=\"description\">Formulario donde se puede ingresar un parrafo, buscar una palabra y reemplazarla por otra a traves del metodo GET en un CGI Perl.</p>";
print "</div>";

print "<div class=\"content\">";

print "<div class=\"container\">";
print "<form action=\"cgi-bin/reemplazar.pl\" method=\"get\">";
print "<fieldset>";
print "<legend>Buscar y Reemplazar:</legend>";
print "<div class=\"row\">";
print "<div class=\"col-25\">";
print "<label for=\"paragraph\">Parrafo:</label>";
print "</div>";
print "<div class=\"col-75\">";
print "<textarea id=\"paragraph\" name='paragraph' placeholder=\"Escribe el parrafo aqui.\" rows=\"4\" cols=\"50\" " . ($is_replaced ? 'disabled' : '') . ">" . encode('UTF-8', $paragraph) . "</textarea>";
print "</div>";
print "</div>";
print "<div class=\"row\">";
print "<div class=\"col-25\">";
print "<label for=\"search\">Buscar:</label>";
print "</div>";
print "<div class=\"col-75\">";
print "<input type=\"text\" id=\"search\" name='search' placeholder=\"Palabra a buscar\" value=\"" . encode('UTF-8', $search) . "\"" . ($is_replaced ? ' disabled' : '') . '>';
print "</div>";
print "</div>";
print "<div class=\"row\">";
print "<div class=\"col-25\">";
print "<label for=\"replace\">Reemplazar por:</label>";
print "</div>";
print "<div class=\"col-75\">";
print "<input type=\"text\" id=\"replace\" name='replace' placeholder=\"Palabra por la que se reemplaza\" value=\"" . encode('UTF-8', $replace) . "\"" . ($is_replaced ? ' disabled' : '') . '>';
print "</div>";
print "</div>";
print "<br>";
print "<div class=\"row\">";
print "<input type=\"submit\" value=\"Reemplazar\"" . ($is_replaced ? ' disabled' : '') . '>';
print "</div>";
print "</fieldset>";
print "</form>";
print "</div>";

# Mostrar solo el parrafo modificado
print "<h3>Resultado:</h3>";
print "<div style=\"border: 1px solid #ccc; padding: 10px; margin: 10px 0; text-align: center;\">";
print "<p>" . encode('UTF-8', $modified_paragraph) . "</p>";
print "</div>";

print "</div>";

print "<footer class=\"footer\">";
print "Huaynacho Mango, Jerry Anderson &copy; 2024/10/24 - Programacion Web Lab. Grupo Z.";
print "</footer>";

print "</div>";

print "</body>";
print "</html>";
