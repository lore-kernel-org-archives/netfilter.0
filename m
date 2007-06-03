From: Marc Haber <mh+netfilter@zugschlus.de>
Subject: Re: Enforce Per User IP Traffic Quota
Date: Sun, 3 Jun 2007 09:23:32 +0200
Message-ID: <20070603072332.GB6442@torres.zugschlus.de>
References: <980676420706022355x3d0e9cfap2be074cef08396b8@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <980676420706022355x3d0e9cfap2be074cef08396b8@mail.gmail.com>
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

On Sun, Jun 03, 2007 at 06:55:04PM +1200, Gardner wrote:
>  I have been searching for a way to limit certain users to a certain
> amount of IP traffic per month.

You need to first find out how you plan to securely _identify_ your
users to prevent them from stealing each others traffic. Depending on
which method of identification you choose, you may have means to
impose the traffic limit at a place where it is easier to impose than
from within netfilter.

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Mannheim, Germany  |  lose things."    Winona Ryder | Fon: *49 621 72739834
Nordisch by Nature |  How to make an American Quilt | Fax: *49 3221 2323190

