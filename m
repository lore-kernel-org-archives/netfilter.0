From: Marc Haber <mh+netfilter@zugschlus.de>
Subject: Re: Unable to block ICMP
Date: Tue, 17 Apr 2007 11:46:11 +0200
Message-ID: <20070417094611.GD13613@torres.zugschlus.de>
References: <46224132.4080702@gmail.com>
	<78a2adce0704150816o77d64848x5982caafd70c30df@mail.gmail.com>
	<46224EFE.6060409@gmail.com>
	<78a2adce0704150914y4e9fd552m8e316ebd1b00ae79@mail.gmail.com>
	<46225C81.6070503@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <46225C81.6070503@gmail.com>
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

On Sun, Apr 15, 2007 at 07:10:25PM +0200, Ronald wrote:
> Well, what I actually wanted (which I probably explained wrong) is that 
> my ports that are not in use (closed) are being invisible (no ICMP 
> echo). That better?

Bad idea. All you're going to achive is that everybody knows "there is
something that is frantically trying to be invisible", which is kind
of a beacon instead of "blending into the crowd".

If you want to be invisible, pull your network cable. As soon as you
talk to the outside, you're going to be visible.

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Mannheim, Germany  |  lose things."    Winona Ryder | Fon: *49 621 72739834
Nordisch by Nature |  How to make an American Quilt | Fax: *49 3221 2323190

