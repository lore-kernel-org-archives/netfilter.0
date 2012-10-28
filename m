From: Ed W <lists@wildgooses.com>
Subject: Re: New/Updated L7 netfilter  option - nDPI
Date: Sun, 28 Oct 2012 16:03:19 +0000
Message-ID: <508D5747.1000304@wildgooses.com>
References: <5088717B.6080300@wildgooses.com> <508D4A16.5020509@ngtech.co.il>
Reply-To: ntop-dev@unipi.it
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <ntop-dev-bounces@listgateway.unipi.it>
In-Reply-To: <508D4A16.5020509@ngtech.co.il>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://listgateway.unipi.it/mailman/options/ntop-dev>,
	<mailto:ntop-dev-request@listgateway.unipi.it?subject=unsubscribe>
List-Archive: <http://listgateway.unipi.it/pipermail/ntop-dev>
List-Post: <mailto:ntop-dev@listgateway.unipi.it>
List-Help: <mailto:ntop-dev-request@listgateway.unipi.it?subject=help>
List-Subscribe: <http://listgateway.unipi.it/mailman/listinfo/ntop-dev>,
	<mailto:ntop-dev-request@listgateway.unipi.it?subject=subscribe>
Sender: ntop-dev-bounces@listgateway.unipi.it
Errors-To: ntop-dev-bounces@listgateway.unipi.it
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Eliezer Croitoru <eliezer@ngtech.co.il>
Cc: netfilter@vger.kernel.org, ntop-dev@unipi.it

On 28/10/2012 15:07, Eliezer Croitoru wrote:

> I tried the new version which is suppose to work with:
> iptables -m ndpi --help
> but it seems like there is an error:
> iptables v1.4.12.1: Couldn't load match `ndpi':No such file or directory
>
> but work with opendpi.
> I am using kernel 3.3.8 64 bit.
>
> did you tested the new changes to work?

Test??  What does that word mean?  :-)


I think the error means that you don't have libxt_ndpi.so in a location 
that your iptables expects to find it?  Often it's /usr/lib/xtables or 
/lib/xtables.  Check where other things are and place the file appropriately

Does that fix it?

Ed
