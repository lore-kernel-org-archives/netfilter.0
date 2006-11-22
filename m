From: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Subject: Re: can't tunnel through iptables
Date: Wed, 22 Nov 2006 18:47:21 -0200
Message-ID: <20061122184721.5ebeb5de@babalu.inexo.com.br>
References: <200611222003.kAMK3G6A024294@alexandrite.boisestate.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200611222003.kAMK3G6A024294@alexandrite.boisestate.edu>
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
To: netfilter@lists.netfilter.org

On Wed, 22 Nov 2006 13:03:16 -0700
Alex Feldman <alex@alexandrite.boisestate.edu> wrote:

> I would like to run the IMAP protocol through an ssh tunnel.  So leaving
> the orignal script in place, I su'd to root on my laptop and entered the
> following command:
> 
> ssh -L 143:myserver:143 myserver

What does your IMAP server line on thunderbird say?
Did you change it to localhost on port 143??
 
> ssh -L 8118:myserver:143 myserver
> 
> to try to set up the tunnel without being root, but nothing seems to
> work - thunderbird always tries and retries and eventually gives up
> trying to establish a connection.

a tcpdump might help. what does it say?

Ethy


