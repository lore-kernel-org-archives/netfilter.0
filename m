From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: rc.local
Date: Tue, 26 Jul 2005 05:41:13 -0500
Message-ID: <42E61349.70106@gmx.co.uk>
References: <42e5502e.57dde3f4.2ba3.ffff9d47SMTPIN_ADDED@mx.gmail.com>
	<9927912d050726025154d3f639@mail.gmail.com>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9927912d050726025154d3f639@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Visham Ramsurrun <vishamr2000@gmail.com>, netfilter@lists.netfilter.org

Visham Ramsurrun wrote:
> Can anyone tell me about the additional configurations that have to 
> be done after i paste of my the contents of my iptables script in

Distro questions belong in a distro forum. I can guarantee that what 
you're doing is the wrong way to set up a firewall at boot time, in any 
distro with which I am familiar. Check your distro's documentation about 
"firewall" or "iptables" and find out the right way to do it.

> rc.local. What things do I have to do for it to take the iptables
> rules in it? I did an iptables -L but no rules were present.

rc.local, like other startup scripts, is a shell script. Do learn what 
that means; I cannot help you unless you know what can/should be in a 
script. Perhaps your time would be best spent at this point in finding 
some basic bash and shell tutorials.

I will throw in a WAG, however: your "script" might have been a set of 
rules for iptables-restore(8).
-- 
     mail to this address is discarded unless "/dev/rob0"
     or "not-spam" is in Subject: header

