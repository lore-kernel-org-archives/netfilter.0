From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: Redirecting outgoing SMTP from LAN to another LAN server
Date: Fri, 30 Apr 2004 13:28:09 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404301328.09722.gdh@acentral.co.uk>
References: <20040429095949.GB22172@acentral.co.uk> <20040429133757.GK7147@samad.com.au> <20040429144757.GA6534@zion.homelinux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040429144757.GA6534@zion.homelinux.com>
Content-Disposition: inline
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

On Thursday 29 April 2004 15:47, Sven Schuster wrote:

>
> iptables -t nat -A POSTROUTING -p tcp -i eth1 -s 10.0.0.0/8 \
>    -d 10.0.0.253 --dport 25 -j SNAT --to 10.0.0.xx:25
>
> where xx would be the ip of your firewall. Now both the packets
> from the client to the server and the returning packets from the
> server to the client will travel through your firewall.

Thanks for the reply - the explanation sounds right, and I think I understand 
what's going on now - I won't be able to test the theory out until next week 
- I just didn't want to seem rude by staying silent to date :)

Cheers,
Gavin.

