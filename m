From: Jason Opperisano <opie@817west.com>
Subject: Re: Strange broadcasts
Date: Mon, 18 Apr 2005 15:25:35 -0400
Message-ID: <20050418192535.GA16525@bender.817west.com>
References: <20050418162301.GA3711@szift.net.autocom.pl>
	<4263FCAD.8080603@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4263FCAD.8080603@riverviewtech.net>
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

On Mon, Apr 18, 2005 at 01:30:05PM -0500, Taylor, Grant wrote:
> This looks like some extremely weird traffic.  Normal M$ RPC traffic should 
> not going to the broadcast address (.255 on each respective subnet).

MS RPC uses TCP 135, not UDP 137 or 138.  netbios name (137) and
datagram (138) are most definitely broadcast-based (in the absence of a
WINS server).

-j

--
"Stewie: They're getting nude! I mustn't watch, it's not the proper
 thing to...Wow! I say, nice ones, Janine! And look at Lisa in all of her
 curvaceous glory! Heavens, it appears that my weewee has been stricken
 with rigor mortis!"
        --Family Guy

