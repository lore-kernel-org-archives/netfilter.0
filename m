From: Jiann-Ming Su <sujiannming@gmail.com>
Subject: Re: How to elegantly handle two ISPs on a single box?
Date: Wed, 6 Apr 2005 14:49:49 -0400
Message-ID: <561dc3260504061149310337e0@mail.gmail.com>
References: <20050406171730.GA12284@torres.l21.ma.zugschlus.de>
Reply-To: Jiann-Ming Su <sujiannming@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050406171730.GA12284@torres.l21.ma.zugschlus.de>
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

On Apr 6, 2005 1:17 PM, Marc Haber <mh+netfilter@zugschlus.de> wrote:
> Is there a more elegant way to do it? Did I miss any docs?
> 

You should take a look at dynamic routing.  Zebra provides such service.

  http://www.zebra.org/

There's a debian package for zebra.
-- 
Jiann-Ming Su
"I have to decide between two equally frightening options. 
 If I wanted to do that, I'd vote." --Duckman

