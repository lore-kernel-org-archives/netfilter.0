From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: Why do I have 'MARK' all over my logs?
Date: Fri, 10 Jun 2005 12:00:01 +0100
Message-ID: <200506101200.01552.gdh@acentral.co.uk>
References: <BAY0-SMTP07EE697B166AFFF0DFD5FFBCFF0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY0-SMTP07EE697B166AFFF0DFD5FFBCFF0@phx.gbl>
Content-Disposition: inline
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

On Friday 10 June 2005 12:01, CompuGenic wrote:

> Jun 9 10:11:12 host -- MARK --
> Jun 9 10:31:12 host -- MARK --
>
> Notice the time patterns? I have no idea where these are coming from? Is
> there a way to know if it's from my firewall, or to track the source?

:)

No need to worry - this is normal and healthy - syslog is letting you know 
that there has been no logging activity but that syslog is still running :)

gdh

