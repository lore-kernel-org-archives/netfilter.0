From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: LAN accessing DMZ
Date: Sun, 18 Jul 2004 18:12:31 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407181812.31070.Antony@Soft-Solutions.co.uk>
References: <f51b72bc040718062373640612@mail.gmail.com> <200407181739.05377.Antony@Soft-Solutions.co.uk> <20040718165830.GA30303@tranquility.scriptkitchen.com>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040718165830.GA30303@tranquility.scriptkitchen.com>
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
To: netfilter <netfilter@lists.netfilter.org>

On Sunday 18 July 2004 5:58 pm, Payal Rathod wrote:

> I have pasted my FORWARD rules at, (they are small and simple),
> http://payal.staticky.com/fw1.txt
>
> It is still very confusing. Forget port 25 for a moment. I have never
> mentioned port 10000, the webmin port at all. Still I can access it
> from my LAN machine? HOW? Afterall the FORWARD policy is DROP. It should
> DROP what it cannot find.

I do not see how TCP port 10000 should be accessible from the Internet either 
(which is what I believe you were asking about - allowing access to the DMZ 
from the Internet, but not from the LAN?)

Please post the output of "iptables -L -nvx; iptables -L -t nat -nvx".   Post 
it on the website if you prefer (the formatting is probably easier to read 
there anyway).   Please also post the IP addresses of the machine you are 
connecting from, and the machine you are connecting to, on TCP port 10000.

Regards,

Antony.

-- 
The words "e pluribus unum" on the Great Seal of the United States are from a 
poem by Virgil entitled "Moretum", which is about cheese and garlic salad 
dressing.

                                                     Please reply to the list;
                                                           please don't CC me.


