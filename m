From: Jiann-Ming Su <sujiannming@gmail.com>
Subject: Re: connection tracking without iptables?
Date: Wed, 29 Sep 2004 22:24:15 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <561dc3260409291924ec5d90d@mail.gmail.com>
References: <7C9884991ADAE0479C14F10C858BCDF5679531@alderaan.smgtec.com>
Reply-To: Jiann-Ming Su <sujiannming@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF5679531@alderaan.smgtec.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wed, 29 Sep 2004 14:22:41 -0700, Daniel Chemko <dchemko@smgtec.com> wrote:
> Jiann-Ming Su wrote:
> > This is probably a dumb question, but is it possible to track
> > connections without iptables/netfilter?
> 
> Yeah, use libpcap and parse it out yourself! (snicker)
> 
> Exactly what are you looking for and why? A good chunk of netfilter is
> *just* connection tracking. What do you expect to get out of just
> conntrack?
> 

Just trying to get an idea of the type and amount of traffic passing
through a subnet.  I've done this before with tcpdump, but that
required an external parsing program to reconstitute all the
connections from the tcpdump capture.

-- 
Jiann-Ming Su
"I have to decide between two equally frightening options.  
                                            If I wanted to do that,
I'd vote." --Duckman

