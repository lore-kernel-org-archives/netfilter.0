From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: Comments and questions about tuning IPTables for high volume
Date: Wed, 17 Dec 2003 10:06:52 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1071673610.2046.180.camel@grendel>
References: <sfe01aa8.008@gwadmin.springisd.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <sfe01aa8.008@gwadmin.springisd.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Pete Davis <peted@springisd.org>
Cc: "<" <netfilter@lists.netfilter.org>

On Wed, 2003-12-17 at 09:58, Pete Davis wrote:
>
> Questions:
> 1) Any suggestions on other tuning? 

You may want to have a look at LARTC:
http://www.lartc.org/

I used these tweaks to push a few boxes with less than half the
horsepower of yours up speeds of 300 Mb/s. Only problem I had was with
logging, but ULOG should cure that.

HTH,
C



