From: "Richard Lynch" <ceo@l-i-e.com>
Subject: Re: looking for the developer of webcbq
Date: Tue, 17 Oct 2006 12:06:14 -0500 (CDT)
Message-ID: <53660.208.195.234.246.1161104774.squirrel@www.l-i-e.com>
References: <30200a940610170135j78592c29uc4cf0bdbe99ec2f4@mail.gmail.com>
Reply-To: ceo@l-i-e.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <php-general-return-243260-php-php-general=m.gmane.org@lists.php.net>
list-help: <mailto:php-general-help@lists.php.net>
list-unsubscribe: <mailto:php-general-unsubscribe@lists.php.net>
list-post: <mailto:php-general@lists.php.net>
In-Reply-To: <30200a940610170135j78592c29uc4cf0bdbe99ec2f4@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gregory Machin <gregory.machin@gmail.com>
Cc: netfilter@lists.netfilter.org, PHP General <php-general@lists.php.net>

Wild Guess:

It relies on register_globals being "on" and you need to change
$nuevoPadre to $_REQUEST['nuevoPadre']

hard to say without seeing the code, but this is my first guess with
the info we have.

On Tue, October 17, 2006 3:35 am, Gregory Machin wrote:
> Hi
> I'm looking for the developer of webcbq, I'm trying to get it to work
> on
> fc5_64 but I have hit a wall there are some errors I can't see why the
> variables are being populated ... and I think is was writtn in php 3
> because
> I have had to change alot on the syntax of the code to get it half way
> working ...
>
> here are the errors ....
>
> *Notice*: Undefined variable: nuevoPadre in *
> /var/www/html/webcbq/parents.php* on line *38*
>
> *Notice*: Undefined variable: borrarRegla in *
> /var/www/html/webcbq/parents.php* on line *53*
>
> *Notice*: Undefined variable: modificarRegla in *
> /var/www/html/webcbq/parents.php* on line *67*
>
> *Notice*: Undefined variable: cambiarNombre in *
> /var/www/html/webcbq/parents.php* on line *76*
>
> *Notice*: Undefined variable: nuevaRegla in *
> /var/www/html/webcbq/children.php* on line *38*
>
> *Notice*: Undefined variable: borrarRegla in *
> /var/www/html/webcbq/children.php* on line *51*
>
> *Notice*: Undefined variable: modificarRegla in *
> /var/www/html/webcbq/children.php* on line *63*
>
> *Notice*: Undefined variable: cambiarNombre in *
> /var/www/html/webcbq/children.php* on line *72*
>
> Many thanks
> --
> Gregory Machin
> gregory.machin@gmail.com
> www.linuxpro.co.za
>


-- 
Some people have a "gift" link here.
Know what I want?
I want you to buy a CD from some starving artist.
http://cdbaby.com/browse/from/lynch
Yeah, I get a buck. So?

-- 
PHP General Mailing List (http://www.php.net/)
To unsubscribe, visit: http://www.php.net/unsub.php

