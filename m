From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: mangle tables.
Date: Tue, 10 Sep 2002 15:04:26 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D7DEDDA.2080404@fugmann.dhs.org>
References: <FLEKIPPLAEDMJMOOBBDPCECJCOAA.stewart.thompson@shaw.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: stewart.thompson@shaw.ca
Cc: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.samba.org

Thanks.

This makes alot of sence.
To sum up, tables are traversed in the following mannor:

             [Packet enters the machine]
                          |
                    mangle-prerouting
                    /              \
   <To the machine itself>  <To be forwarded> [Locally gen. packet]
                   |                |                 |
             mangle-input     mangle-forward    mangel-output
                   |                |                 |
             filter-input     filter-forward    filter-output
                   |                \                 /
       [next level of the OSI]       mangle-postrouting					                                    |
                                 [packet leaves the machine]

Legend:
[]: Event.
<>: Case (if).
| : Connector.

(mangle tables intentionally left out)
So there is no doubt that mangle-forward is traversed _before_ 
filter-forward.

Thanks again for clarifying.

Regards
Anders Fugmann


