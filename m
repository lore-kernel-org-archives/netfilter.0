From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: safe default chain policies
Date: Fri, 2 Apr 2004 08:42:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404020842.35259.Antony@Soft-Solutions.co.uk>
References: <BAY16-F59EdJ7BzKkc100034639@hotmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY16-F59EdJ7BzKkc100034639@hotmail.com>
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

On Friday 02 April 2004 5:58 am, Philippe Anctil wrote:

> Hello list,
>
> I've had quite a bit of trouble setting up nat rules on my iptables home
> network firewall.

I'm not surprised, because...

> I set all of input and nat chains to DROP.

Do NOT set the nat table policies to DROP.   The nat tables are for address 
translation, not for filtering (DROP is a filtering operation).

> I am thinking to set all chains to ACCEPT except the INPUT chain.

No.   Set default DROP on INPUT, FORWARD and OUTPUT, then add rules to allow 
the traffic you want.

Set default ACCEPT on all nat and mangle tables, and *really* think hard if 
you ever find yourself wondering about putting a rule in one of those tables 
with a DROP target.

Regards,

Antony.

-- 
The words "e pluribus unum" on the Great Seal of the United States are from a 
poem by Virgil entitled "Moretum", which is about cheese and garlic salad 
dressing.

                                                     Please reply to the list;
                                                           please don't CC me.


