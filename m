From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: What is missed for port forwarding
Date: Sun, 7 Mar 2004 09:53:52 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403070953.52863.Antony@Soft-Solutions.co.uk>
References: <20040306183657.GB836@glorybox.de> <200403061847.28569.Antony@Soft-Solutions.co.uk> <20040307094013.GA3156@glorybox.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040307094013.GA3156@glorybox.de>
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

On Sunday 07 March 2004 9:40 am, Kai Weber wrote:

> The strange thing: the rule for portforwarding for SSH works. The
> package counter for that rules is increasing when I try to connect to
> that port. But there is now response.

Sorry, are you saying here that the packet counter for the port 8888 rule is 
increasing when you try to connect, but you get no response from the server?

Are you testing both SSH/10143 and HTTP/8888 from the same client machine out 
on the Internet?

Antony.

-- 
If you want to be happy for an hour, get drunk.
If you want to be happy for a year, get married.
If you want to be happy for a lifetime, get a garden.

                                                     Please reply to the list;
                                                           please don't CC me.


