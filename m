From: Marc Haber <mh+netfilter@zugschlus.de>
Subject: Re: Allow only SMTP 'callback'
Date: Mon, 10 Jan 2005 12:34:46 +0100
Message-ID: <20050110113446.GC1098@torres.l21.ma.zugschlus.de>
References: <200501101030.59086.gdh@acentral.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200501101030.59086.gdh@acentral.co.uk>
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

On Mon, Jan 10, 2005 at 10:30:59AM +0000, Gavin Hamill wrote:
> Normally I permit only port 80 incoming to our webservers, but since each 
> webserver also sends out booking-complete confirmation emails, I would like 
> to also enable incoming port 25 for those remote mail servers who 'call back' 
> to check that the envelope sender  / HELO address is truly a reachable mail 
> server.
> 
> I don't particularly want to leave port 25 simply open, but only for those 
> hosts with whom an outgoing port 25 connection is already established with.

If your webservers send out the booking-complete confirmation emails
with a correct envelope and header sender, the callback will go to the
mail servers and complete there.

I don't see the problem here.

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Mannheim, Germany  |  lose things."    Winona Ryder | Fon: *49 621 72739834
Nordisch by Nature |  How to make an American Quilt | Fax: *49 621 72739835

