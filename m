From: Eric Leblond <eleblond@init-sys.com>
Subject: Re: QoS on dynamic port allocation protocols
Date: 13 Mar 2003 15:07:12 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1047564432.10039.25.camel@tech004.alphalink.fr>
References: <OFA83BF598.09B2B5B9-ON83256CE8.000228A8@LocalDomain>
	 <1047533324.11445.64.camel@raylinux.internal>
	 <1047562853.3e708a65c21a5@www.spsul.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1047562853.3e708a65c21a5@www.spsul.com.br>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Thu, 2003-03-13 at 14:40, alexb@atix.com.br wrote:
> But how do I distinguish RELATED connection from ftp and H323 ?
> If I only whant to limit bandwidht for ftp and not for H323, how could I tell
> iptable to mark only the RELATED packets from ftp connections ?

You better use the connmark target to suit your need. You can find a
little doc about it on :
	http://home.regit.org/connmark.html
The process is the following :
	you mark initial packet
	connmark restore a mark related to the connection.

BR
-- 
Eric Leblond <eleblond@init-sys.com>
Init-Sys


