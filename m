From: Jason Opperisano <opie@817west.com>
Subject: Re: Port redirection
Date: Tue, 31 May 2005 22:45:22 -0400
Message-ID: <20050601024522.GA7118@bender.817west.com>
References: <20050531192503.92186.qmail@web51002.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050531192503.92186.qmail@web51002.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, May 31, 2005 at 12:25:03PM -0700, Chris NoSurname wrote:
> Hi all.
> 
> I've searched and searched and I cannot seem to get
> this working.
> 
> I'm trying to redirect port 80 to a different port so
> that I can run the Resin application server as
> non-root user.  I've got the following command..
> 
> iptables -t nat -A PREROUTING -p tcp --dport 80 -d
> x.x.x.x -j REDIRECT --to-ports 8900

if resin is not listening on $INBOUND_IF_IP:8900; or more realistically
0.0.0.0:8900, then it wouldn't work.  REDIRECT rewrites the dst IP to be
the IP of the receiving interface, since you don't even have an "-i $IF"
specified in that rule, resin would have to be listening on 0.0.0.0:8900
to even have a shot at working properly (or the machine in question
only has a single interface, perhaps?).

-j

--
"Peter: We love the Bible in this house.
 Francis: Really. What's your favorite book of the Bible?
 Peter: Uhhhhh... the book where Jesus swallows the puzzle piece and
 the man in the yellow hat has to take him to the hospital."
        --Family Guy

