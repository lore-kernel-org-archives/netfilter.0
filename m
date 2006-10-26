From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: IPTables script problem...
Date: Thu, 26 Oct 2006 14:06:51 +0200
Message-ID: <4540A4DB.6080001@freemail.hu>
References: <4540847B.8080407@bowenvale.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4540847B.8080407@bowenvale.co.nz>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Don Gould <don@bowenvale.co.nz>
Cc: netfilter@lists.netfilter.org

Don Gould =EDrta:
> Can anyone tell me why this isn't working?
>
=2E..
>
> [root@bowenvale shared]# cat dhcp.src
> #!/bin/sh
For debug try this:

#!/bin/bash -x

> nowdate=3D$(date)
> # echo $nowdate, $0, $1, $2, $3 >> /home/shared/dhcpconnect.log
>
> echo $nowdate, $2, $3 >> /home/shared/dhcpconnect.log
>
> echo "Start" >> /home/shared/dhcpconnect.log
>
> mysql -h bowenvale -u oncs -pbutterfly -e "INSERT INTO
> oncs.tblSessionRequest (MACAddress, IPAddress) VALUES('$2', '$3
>    ');" &> /home/shared/dhcpconnect.log
hmm...
You mean:
&>>/home
???
> echo "Done - database log" >> /home/shared/dhcpconnect.log
>
> # Now we start the data accounting bit using IP tables...
> # Make sure the iptables rules exist!  This should return errors becaus=
e
> these rules should always already exist.
> iptables -N traffic_in  >> /home/shared/dhcpconnect.log
> iptables -N traffic_out  >> /home/shared/dhcpconnect.log
>
> echo $nowdate, $2, $3 >> /home/shared/dhcpconnect.log
>
> echo "Done - rule create" >> /home/shared/dhcpconnect.log
>
> # Create Rule for IP to count the data.
> iptables -A traffic_in -d $3  >> /home/shared/dhcpconnect.log
> iptables -A traffic_out -s $3  >> /home/shared/dhcpconnect.log
>
> echo "Done - counter add" >> /home/shared/dhcpconnect.log
>
> #add chains as target to FORWARD rule - after the first time, this
> should always be already done.
> iptables -I FORWARD 1 -j traffic_in  >> /home/shared/dhcpconnect.log
> iptables -I FORWARD 2 -j traffic_out  >> /home/shared/dhcpconnect.log
>
>
> echo "Done forward rule add" >> /home/shared/dhcpconnect.log
>
> echo "Done", $2, $3  >> /home/shared/dhcpconnect.log
>
What is in dhcpconnect.log ??? :)
Could you post it? :)

Swifty


