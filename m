From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: NTP
Date: Fri, 2 Jul 2004 12:23:37 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <SERVER7IIZS2TRqf69a00000056@server7.bandwidthco.com>
References: <200407021906.41982.Antony@Soft-Solutions.co.uk>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407021906.41982.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org

 

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Antony Stone
Sent: Friday, July 02, 2004 11:07 AM
To: netfilter@lists.netfilter.org
Subject: Re: NTP

On Friday 02 July 2004 5:28 pm, Hudson Delbert J Contr 61 CS/SCBN wrote:

> do not i repeat...do not allow inbound ntp with a source port above 
> the root ports.

Why not?   What difference does the client's source port make?

Antony.

Yes - I'm quite curious about this too as the protocol "normally" acts as
follows:
Client > 1023 -> Server 123
Server 123 -> Client > 1023
Server 123 -> Server 123



