From: "Leonardo Santagostini" <lsantagostini@celletech.com.ar>
Subject: RE: A question and a little ascii art
Date: Fri, 17 Oct 2003 09:48:33 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000501c394ac$f9dcf8c0$1900a8c0@celletech.com.ar>
References: <Pine.LNX.4.51.0310161843410.2162@dns.toxicfilms.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.51.0310161843410.2162@dns.toxicfilms.tv>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: 'Maciej Soltysiak' <solt@dns.toxicfilms.tv>
Cc: netfilter@lists.netfilter.org

Sorry but i think my explanation in some point was wrong

       _________Machine A
      /
   Internet
      | _____200.68.69.XXX
      |/
  Fw / Apache
      |\
      | \____192.168.0.254
      |
      |
   --------------------------------------
   |                  |                  |
192.168.0.1        192.168.0.25        192.168.0.XXX
 NT / IIS

1) The goal is: Folowing one link at my isp to 200.68.69.XXX:someport
(in my case 15000) to launch an app located in my NT box. (This point
works fine only FROM Internet not from my LAN)
2) When im pointing from my LAN to 200.68.69.XXX:15000 (this is because
the main app page (not application) is located at my ISP) cant see de
IIS (and i think that i must be automaticaly delivered to)

Maybe this short (uh)!! Explanation can help

Yours,
Leonardo      


-----Mensaje original-----
De: Maciej Soltysiak [mailto:solt@dns.toxicfilms.tv] 
Enviado el: Jueves, 16 de Octubre de 2003 01:47 p.m.
Para: Leonardo Santagostini
CC: netfilter@lists.netfilter.org
Asunto: Re: A question and a little ascii art


> But on the LAN side (162.168.0.0) i cant see the app pointing to 
> 200.68.69.xxx:15000
Not :15000, follow this:

Some host A(a.b.c.d) asks 200.68.69.1 asks for a connection, we see
this:

1. Start connection:
	a.b.c.d:1025 -> 200.68.69.1:15000

2. Do NAT:
	200.68.69.1:15000 -> 192.168.0.1:80

3. 192.168.0.1 sends the reply, you should see:
	192.168.0.1:80 -> a.b.c.d:1025

So you won't see packets destined for the firewall with port 15000, but
you'd rather see packets that are destined for a.b.c.d:1025

By 1025 I mean a random high port that will be the clientside port for
that particular connection.

Regards,
Maciej


