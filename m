From: "IT Clown" <iptables@mailbox.co.za>
Subject: Re: I still have no idea why this doesn't work...(further
  details)
Date: Sun, 25 Apr 2004 08:59:21 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <web-294871830@mail01.infosat.net>
References: <6.0.0.22.0.20040424185336.02b41450@mail.garisonpiatt.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <6.0.0.22.0.20040424185336.02b41450@mail.garisonpiatt.com>
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
To: netfilter@lists.netfilter.org

have you tried: modprobe ip_nat_ftp
Try iptables -A INPUT -p tcp --dport 20 -j ACCEPT
                                                            
                   
with your current rule of --dport 21


On Sat, 24 Apr 2004 18:53:43 -1000
 Garison Piatt <todo@garisonpiatt.com> wrote:
> At 03:57 PM 4/23/04 +0100, Antony Stone wrote:
> ># Set default drop polcy on all tables
> >iptables -P INPUT DROP
> >iptables -P OUTPUT DROP
> >iptables -P FORWARD DROP
> >
> ># Allow replies out for anything which comes in
> >iptables -A OUTPUT -m state --state ESTABLISHED,RELATED
> -j ACCEPT
> ># Allow the machine to do its own DNS lookups
> >iptables -A OUTPUT -p tcp --dport 53 -j ACCEPT
> >iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
> ># Allow replies in for anything which goes out (eg DNS)
> >iptables -A INPUT -m state --state ESTABLISHED,RELATED
> -j ACCEPT
> ># Allow the world to access by HTTP
> >iptables -A INPUT -p tcp --dport 80 -j ACCEPT
> ># Allow the world to access by FTP (you *did* want that,
> yes?)
> >iptables -A INPUT -p tcp --dport 21 -j ACCEPT
> ># Allow the world to access by SSH (would be nicer to
> restrict by IP addres,
> >but we can't, so....)
> >iptables -A INPUT -p tcp --dport 22 -j ACCEPT
> 
> Okay, I did this, and received the following when I tried
> to FTP into the site:
>    i Control connection successfully established.
>    < 220 ProFTPD FTP Server ready.
>    i Time zone of server could not be determined.
>    > USER admin
>    < 331 Password required for admin.
>    > PASS <password>
>    < 230 User admin logged in.
>    > SYST
>    < 215 UNIX Type: L8
>    > PWD
>    < 257 "/home/admin" is current directory.
>    > PASV
>    < 227 Entering Passive Mode (207,36,232,90,132,36).
>    i Data connection A8 could not be established (10060).
> followed by a notice that the connection timed out.
>  Changing the FTP parameters didn't have much effect.
>  Also, the browser connects to the site, but times out
> before displaying any data.  And everything is *s-l-o-w*.
> 
> Any ideas?  
> 

______________________________________________________________
Herbalife Independent Distributor http://www.healthiest.co.za

