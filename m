From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ping to internet hosta through NameServer of provider
Date: Wed, 10 Mar 2004 10:41:03 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403101041.03840.Antony@Soft-Solutions.co.uk>
References: <E1B10qN-0003HJ-9V@vishnu.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E1B10qN-0003HJ-9V@vishnu.netfilter.org>
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

On Wednesday 10 March 2004 10:22 am, Stanislav Puffler DiS. wrote:

> Apologize, these are my rulesets. As for pinging internet hosts, it is
> working corectly now (after accepting packets from ISP NameServer).

Good.

> But the only one problem is, that there are still logs in shell prompt and i
> am not typing anything...

I am not sure I understand why this is a problem.   Do you mean you want the 
logs to go to syslog instead of the console, or do you mean that you don't 
udnerstand why packets are arriving at your firewall and being logged when 
you are not creating them?

If it's the first, then you should investigate the --log-level option to the 
LOG target, and check your syslog.conf setup.

If it's the second, then the simple answer is that packets are sent to 
arbitrary addresses around the Internet all the time, and it does not take 
long after plugging a packet logger into a previously unused IP address 
before you start seeing traffic turn up...

Regards,

Antony.

-- 
The words "e pluribus unum" on the Great Seal of the United States are from a 
poem by Virgil entitled "Moretum", which is about cheese and garlic salad 
dressing.

                                                     Please reply to the list;
                                                           please don't CC me.


