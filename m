From: Martijn Klingens <mklingens@ism.nl>
Subject: Re: Unexpected RSTs?
Date: Wed, 16 Oct 2002 15:36:52 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210161536.52930.mklingens@ism.nl>
References: <200210111434.52124.mklingens@ism.nl> <200210111303.g9BD3mL19306@vulcan.rissington.net> <200210111629.26991.mklingens@ism.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200210111629.26991.mklingens@ism.nl>
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

On Friday 11 October 2002 16:29, Martijn Klingens wrote:
> On Friday 11 October 2002 15:03, Antony Stone wrote:
> > Maybe you could try putting a LOG rule to catch *all* RSTs at the
> > beginning of your rules (before even the ESTABLISHED, RELATED rule) and
> > see if this shows they are coming along in pairs ?
>
> Good idea. I'm not going to modify the firewall so close before the
> weekend, but will do so next monday. Thanks for the tip and I'll let you
> know about the results!

Just did some small tests, and unfortunately this idea seems to be incorrect.

Each 'unexpected rst' has exactly *ONE* RST coming in, so it's not a duplicate 
entry being dropped, it's a unique entry.

Also, the IP addresses causing unexpected RSTs are sending accepted RSTs later 
on in the firewall log with a slightly higher port number, so it looks like 
the senders are legitimate and not malicious users.

Do you have any other ideas why the RSTs are not accepted by the conntrack 
code as 'related' ?

-- 
Martijn


