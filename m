From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: chains in the same table
Date: Thu, 6 May 2004 11:47:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405061147.35201.Antony@Soft-Solutions.co.uk>
References: <004c01c4334f$3f1329f0$cb0210ac@jz105>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <004c01c4334f$3f1329f0$cb0210ac@jz105>
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

On Thursday 06 May 2004 10:48 am, Jee J.Z. wrote:

> Hi all,
>
> I'm asking a basic question that in the same table (for example, the filter
> table), if a packet hit the INPUT chain while no rules are in the INPUT
> chain and the default policy is ACCEPT, will the packet be passed on to the
> FORWARD chain? If accepted again, be passed on to the OUTPUT chain?

Any single packet only traverses one of the above chains.

If it's addressed *to* the machine, it goes through INPUT only.

If it's addressed *from* the machine, it goes through OUTPUT only.

If it's going *from* somewhere else *to* somewhere else (ie: being routed), it 
goes through FORWARD only.

(I guess there's an exception that loopback packets will go through both 
OUTPUT and INPUT, but that's unusual.)

Regards,

Antony.

-- 
Ramdisk is not an installation procedure.

                                                     Please reply to the list;
                                                           please don't CC me.


