From: Dax Kelson <dax@gurulabs.com>
Subject: RE: intermittent and unreliable behaviour with iptables scripts
Date: 13 Nov 2002 11:13:54 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1037211234.2257.14.camel@mentor>
References: <91F7518FF779D41181A700010266356D015555DE@mail.springbound.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <91F7518FF779D41181A700010266356D015555DE@mail.springbound.com>
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
To: Doug Watson <doug@1stbooks.com>
Cc: 'alex' <alex@bennee.com>, "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

On Wed, 2002-11-13 at 07:34, Doug Watson wrote:
> Thank you for your prompt response.
> 
> If there really is a bug in ip_conntrack
> that makes me unfortunately skiddish about 
> continuing on with netfilter/iptables as a 
> viable solution for my company. Yet it seems 
> like many people have implemented this and have
> not seen these types of problems.
> 
> I have run the script that you sent me several times.
> Attached is a sample output from it. I don't believe that
> I am seeing anything too strange, but I do have 1 question.
> in the following line which you will see in the attached file
> what does the (policy ACCEPT 4 packets, 284 bytes) mean?
> Chain OUTPUT (policy ACCEPT 4 packets, 284 bytes)
> 
> Is that the total number of packets to traverse the OUTPUT 
> chain or it he number of packets ACCEPTED by the policy for the 
> OUTPUT chain? Or something else?
> 
> Thank you,
> Doug Watson

I don't think there is a bug, but rather improper rules. This is a
common mistake that beginners and experts make on firewalls.

What you describe:

"When browsing the web, web pages that normally would load very quickly
seem to hang for an inconsistent amount of time, anywhere between 1
second to 30 seconds or more before they would even begin to load or
would at times never load at all as if the connection to the web was
lost."

This is the CLASSIC (bizarre, yes) symptom of IP fragmentation not
working properly. When I first say these symptoms in 1996, it stumped me
for awhile.

Why would IP fragmentation not be working properly? The answer is that
you are not letting ICMP Type 3, Code 4 (ala fragmentation-needed)
packets through.

I don't know what your specific rules are, but generally the solution is
to have the following rule as the first rule in either INPUT, OUTPUT, or
FORWARD (or all three, which one depends on the overall design of your
ruleset).

iptables -A INPUT/OUTPUT/FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

The 'RELATED' will catch those ICMP Typ3, Code 4 packets.

Dax Kelson
Guru Labs


