From: Stewart Thompson <stewart.thompson@shaw.ca>
Subject: RE: more than 1 source ip
Date: Tue, 26 Nov 2002 14:49:59 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FLEKIPPLAEDMJMOOBBDPAEHJDJAA.stewart.thompson@shaw.ca>
References: <001501c29532$a453bd50$e6353fc1@nexor.co.uk>
Reply-To: stewart.thompson@shaw.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <001501c29532$a453bd50$e6353fc1@nexor.co.uk>
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
To: "wasim.bashir" <wasim.bashir@nexor.co.uk>, netfilter <netfilter@lists.netfilter.org>

Hi Wasim:

	I have seen a number of replies to this telling you it is insecure.
While that is true, it always exposes you to a risk when you open up
any port.  The authentication system on VNC is not very strong. However,
you can use Stunnel to add more security, but that is another matter not
relevant here. If you are always coming form the same source address it
is fairly secure, notwithstanding IP spoofing. If you need to access two
machines from the same source IP then use two rules with different ports.

/sbin/iptables -A PREROUTING -t nat -p tcp -s <outside IP> -d <ip of my
machine>  --dport 5800 -j DNAT --to 10.0.0.199:5800

/sbin/iptables -A PREROUTING -t nat -p tcp -s <outside IP> -d <ip of my
machine>  --dport 5801 -j DNAT --to 10.0.0.200:5800

If you need to allow access to the same machine from two different external
addresses.
The rules suggested by Erdal should work fine.

/sbin/iptables -A PREROUTING -t nat -p tcp -s <outside IP1> -d <ip of my
machine>  --dport 5800 -j DNAT --to 10.0.0.199:5800

/sbin/iptables -A PREROUTING -t nat -p tcp -s <outside IP2> -d <ip of my
machine>  --dport 5800 -j DNAT --to 10.0.0.199:5800

	By the way, 5800 is the browser JAVA ports, the standard VNC viewer
Used 5900. Hope that helps.


Stu...........

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Wasim Bashir
Sent: November 26, 2002 2:00 AM
To: netfilter
Subject: more than 1 source ip

Hi,

how do i select more than 1 source IP, what i want to do is allow vnc access
to an internal win2k box from 2 different ip addresses, how do you do this,
at the moment i'm using :

/sbin/iptables -A PREROUTING -t nat -p tcp -s <outside IP> -d <ip of my
machine>  --dport 5800 -j DNAT --to 10.0.0.199:5800

Any help would be much appreciated.

Thanks

Wasim



