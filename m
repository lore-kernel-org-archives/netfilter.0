From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Nat with virtual interfaces
Date: 27 Jun 2002 14:14:18 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <1025180059.2831.13.camel@rayw>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020627141233.A2703@oknodo.bof.de>
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
To: Patrick Schaaf <bof@bof.de>
Cc: Mika Ullgren <mika.ullgren@lemonplanet.com>, netfilter@lists.samba.org

Hi

On Thu, 2002-06-27 at 14:12, Patrick Schaaf wrote:
> Hi Mika,
> 
> try to use DNAT instead of REDIRECT, explicitly giving the one or the
> other local destination IP address. I guess that since the REDIRECT
> target does not take an IP address as an argument, it has a hard time
> coping with your multiple-IP seperation issue.
> 
> (I'm guessing because I never used REDIRECT for such a setup, so I'm a bit
> unsure)
> 
That shouldn't make a difference since the traffic is bound for the same
machine and the same ip.

However, if it doesn't work, try swapping the ips on eth0 and eth0:0 and
try connect to the .75 (now on eth0) and see if the results are the same
or if it works. If it still doesn't work , then I'd suspect something
wrong in the virtual host setup in apache. Also, try the test config
file feature of apache to verify your config file.

> best regards
>   Patrick

Ray

