From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: RTSP & RTP w/ Darwin Thru iptables
Date: Wed, 21 Jul 2004 21:50:39 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407212150.39176.Antony@Soft-Solutions.co.uk>
References: <6.0.0.22.0.20040721132755.037c5bb8@arctictern.ddive.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <6.0.0.22.0.20040721132755.037c5bb8@arctictern.ddive.com>
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

On Wednesday 21 July 2004 9:36 pm, Dan Barron wrote:

> Hello,
>
> I have been struggling with setting up my iptables firewall to allow for
> RTSP & RTP connections to a Darwin Streaming Server. 

What protocols does this use?   TCP?   UDP?   Something else?

> I have a firewall with a public Internet connection and a DMZ and private
> LAN.  The Darwin server lives on its own server in the DMZ.

Does Darwin claim to operate across nat (which it sounds as though you are 
using)?   Does Darwin specifically state it will not work across nat?

What netfilter rules do you have at present, in the non-working setup, and 
what packets are being dropped or unreplied (if you don't know the answer to 
this last part, add some LOGging rules to find out what packets are not 
either reaching their destination, or being replied to).

Regards,

Antony.

-- 
Users don't know what they want until they see what they get.

                                                     Please reply to the list;
                                                           please don't CC me.


