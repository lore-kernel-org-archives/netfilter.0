From: Jason Opperisano <opie@817west.com>
Subject: Re: Linux as router (Gateway Server) [Revisited]
Date: Mon, 31 Jan 2005 11:37:55 -0500
Message-ID: <20050131163755.GA25101@bender.817west.com>
References: <00a601c4fe34$5e74bd80$eaab9385@gagan>
	<1106851960.14748.6.camel@localhost.localdomain>
	<005701c507a8$f84e5330$eaab9385@gagan>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <005701c507a8$f84e5330$eaab9385@gagan>
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

On Mon, Jan 31, 2005 at 08:54:10PM +0530, Navneet wrote:
> Below is my working tables rules.But i can't able to successfully establish
> external ftp sites/servers.
> 
> i even loaded ip_conntrack_ftp

but you didn't load ip_nat_ftp.

-j

--
"Here are your messages: 'You have thirty minutes to move your
 car.' 'You have ten minutes to move your car.' 'Your car has been
 impounded.' 'Your car has been crushed into a cube.' 'You have thirty
 minutes to move your cube.'"
        --The Simpsons

