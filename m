From: Sander Sneekes <sander@dmdsecure.com>
Subject: Re: load balancing
Date: 03 Feb 2003 15:35:10 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1044282910.16954.25.camel@sander>
References: <1044280193.16953.15.camel@sander>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Jtb28g/wA+/byfEXHdBo"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1044280193.16953.15.camel@sander>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-Jtb28g/wA+/byfEXHdBo
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

currently i'm using this line

iptable -t nat -A PREROUTING -d X.X.X.X -p tcp --dport http -j DNAT
--to-dest 192.168.0.100-192.168.0.111

this this the job but the if i use the same client it always uses 100
for ex. 

but we need to do some preformance test with 3 client's so everytime a
client
does a reqeust to the http server i want to get it for a different
server.

anybody ?

thanks
Sander


On Mon, 2003-02-03 at 14:49, Sander Sneekes wrote:

> Hi all,
> 
> I need to load balance between 2 webserver 
> what is the most fastest way of doing this?
> With iptables? if yes wich line's do i need to use
> i have a RH 7.2 with iptables running already doing
> al network traffic
> 
> cheers
> Sander

--=-Jtb28g/wA+/byfEXHdBo
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/1.1.5">
</HEAD>
<BODY>
currently i'm using this line<BR>
<BR>
iptable -t nat -A PREROUTING -d X.X.X.X -p tcp --dport http -j DNAT --to-dest 192.168.0.100-192.168.0.111<BR>
<BR>
this this the job but the if i use the same client it always uses 100 for ex. <BR>
<BR>
but we need to do some preformance test with 3 client's so everytime a client<BR>
does a reqeust to the http server i want to get it for a different server.<BR>
<BR>
anybody ?<BR>
<BR>
thanks<BR>
Sander<BR>
<BR>
<BR>
On Mon, 2003-02-03 at 14:49, Sander Sneekes wrote:
<BLOCKQUOTE TYPE=CITE>
    <FONT COLOR="#737373" SIZE="3"><I>Hi all,<BR>
    <BR>
    I need to load balance between 2 webserver <BR>
    what is the most fastest way of doing this?<BR>
    With iptables? if yes wich line's do i need to use<BR>
    i have a RH 7.2 with iptables running already doing<BR>
    al network traffic<BR>
    <BR>
    cheers<BR>
    Sander</I></FONT>
</BLOCKQUOTE>
</BODY>
</HTML>

--=-Jtb28g/wA+/byfEXHdBo--


