From: Payal Rathod <payal-iptables@staticky.com>
Subject: Re: a small quick and dirty solution
Date: Thu, 14 Aug 2003 12:21:31 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030814065131.GB1761@linux.local>
References: <20030812075752.GA16407@staticky.com> <20030812105914.M60420@mail.mynetsec.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030812105914.M60420@mail.mynetsec.com>
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
Content-Transfer-Encoding: 7bit
To: "anantharaman.iyer" <ananth@mail.mynetsec.com>
Cc: Netfilter ML <netfilter@lists.netfilter.org>

On Tue, Aug 12, 2003 at 04:29:14PM +0530, anantharaman.iyer wrote:
> Generally the default policy of any firewall is kept as "Default Deny" and 
> then the administrator can open up the required ports. So any packet hitting 
[...]

Ok. Great. Then does this mean,

$IPTABLES -A INPUT -p tcp -s 0/0 -d $STATIC_IP --dport 21 -j ACCEPT

$IPTABLES -P INPUT DROP


that all connection except to port 21 of external ip are not allowed.

Also should default rule be kept first or last as I have done below?
Or does it not matter in my case?

Thanks a lot for the explanation and bye.

With warm regards,
-Payal

-- 
"Visit GNU/Linux Success Stories"
http://payal.staticky.com
Guest-Book Section Updated.

