From: Marc Haber <mh+netfilter@zugschlus.de>
Subject: Re: Logging suggestions
Date: Tue, 12 Apr 2005 20:15:32 +0200
Message-ID: <20050412181530.GE809@torres.l21.ma.zugschlus.de>
References: <0aa401c53f73$5c19a2a0$09603fca@southern>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <0aa401c53f73$5c19a2a0$09603fca@southern>
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

On Tue, Apr 12, 2005 at 08:51:54PM +0530, hareram wrote:
> I have large  capacity link like STM with my provider
> Iam planning to log the every packet, source IP , Dest IP, Src port, Dest 
> port , Type of Service
> what kind of system configuration recommended

If you want to do this for accounting purposes, then it is feasible to
sum up packet count and packet size. ulog-acctd can be used for that
purpose.

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Mannheim, Germany  |  lose things."    Winona Ryder | Fon: *49 621 72739834
Nordisch by Nature |  How to make an American Quilt | Fax: *49 621 72739835

