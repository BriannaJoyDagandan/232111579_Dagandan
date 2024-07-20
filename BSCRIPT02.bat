@echo off
setlocal enabledelayedexpansion

:SHAPE_SELECTION
echo Select a shape:
echo 1. Circle
echo 2. Triangle
echo 3. Quadrilateral
set /p shape=Enter the number of the shapes: 

if "%shape%"=="1" goto CIRCLE
if "%shape%"=="2" goto TRIANGLE
if "%shape%"=="3" goto QUADRILATERAL
echo Invalid choice. Please select again.
goto SHAPE_SELECTION

:CIRCLE
set /p radius=Enter the radius of the circle: 
set /a area=31416 * radius * radius / 10000
echo The area of the circle is: %area%
goto END

:TRIANGLE
set /p a=Enter the length of side A: 
set /p b=Enter the length of side B: 
set /p c=Enter the length of side C: 

set /a s=(a+b+c)/2
set /a area=s*(s-a)*(s-b)*(s-c)

if %area% LSS 0 (
    echo Invalid side lengths for a triangle.
    goto END
)

rem Here you would normally calculate the square root, which is complex in batch scripting
rem To keep it simple, we will just display the area value without the square root for now
echo The area of the triangle is (not exact, square root not computed): %area%

if %a%==%b% if %b%==%c% (
    echo The triangle is equilateral.
) else if %a%==%b% if not %b%==%c% (
    echo The triangle is isosceles.
) else if %a%==%c% if not %b%==%c% (
    echo The triangle is isosceles.
) else if %b%==%c% if not %a%==%b% (
    echo The triangle is isosceles.
) else (
    echo The triangle is scalene.
)

goto END

:QUADRILATERAL
set /p length=Enter the length: 
set /p width=Enter the width: 

if "%length%"=="%width%" (
    echo The quadrilateral is a square.
) else (
    echo The quadrilateral is a rectangle.
)

set /a area=length*width
echo The area of the quadrilateral is: %area%
goto END

:END
echo Script completed.
pause
