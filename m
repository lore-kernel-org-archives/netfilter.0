From: "Omar Castaneda Acosta" <omar@idea.com.mx>
Subject: RE: ftp forward to internal machine
Date: Tue, 4 Jun 2002 16:24:47 -0600
Sender: netfilter-admin@lists.samba.org
Message-ID: <3A5DC36EC1506C40825C05BE65E62AEF0E79E7@neptuno.idea.com.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.samba.org

I've never included port 20 on my firewall rules and both passive and
active ftp work fine.

-----Original Message-----
From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk]
Sent: Tuesday, June 04, 2002 4:12 PM
To: netfilter@lists.samba.org
Subject: Re: ftp forward to internal machine

On Tuesday 04 June 2002 11:00 pm, Travis Crook wrote:

> Hello everyone,
>     I have a firewall configured to forward port 80 traffic to an
internal
> machine.  I was wondering if the same thing is possible with ftp
traffic.
> The rules I am using are as follows:
>
> iptables -A PREROUTING -t nat -i EXTINF -p tcp -d 1.2.3.4 --dport 21
-j
> DNAT --to 192.168.2.5:21
>
> iptables -A FORWARD -i EXTINF -p tcp -d 192.168.2.5 --dport 21 ACCEPT
>
> iptables -A FORWARD -i EXTINF -o INTIF -p tcp --dport 21 -m state
--state
> NEW,ESTABLISHED,RELATED -j ACCEPT
>
> iptables -t nat -A PREROUTING -i EXTINF -p tcp --dport 21 -d 1.2.3.4
-j
> DNAT --to-destination 192.168.2.5:21
>
> iptables -t nat -A POSTROUTING -o INTIF -p tcp --dport 21 -d
192.168.2.5 -j
> SNAT --to-source 192.168.2.254
>
> I can connect to the ftp server but then I cannot establish a data
channel
> between the client and the server.

You haven't included port 20.

Ftp uses port 21 for the control connection, and port 20 for the data
connection.   You must translate and forward both of them for ftp to
work,
and even then in these circumstances I think you'll only be able to use
passive mode.


Antony

