From: Marcello Scacchetti <marcello.scacchetti@nextrem.it>
Subject: Re: QoS limitations ....
Date: 17 Dec 2002 20:17:32 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1040152651.12452.4.camel@nxitmirms1>
References: <1040123813.1886.89.camel@rayw.knowledgefactory.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1040123813.1886.89.camel@rayw.knowledgefactory.co.za>
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
To: raymondl@knowledgefactory.co.za
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

After some checking i found this:
/* "Handles"
   ---------

    All the traffic control objects have 32bit identifiers, or
"handles".

    They can be considered as opaque numbers from user API viewpoint,
    but actually they always consist of two fields: major and
    minor numbers, which are interpreted by kernel specially,
    that may be used by applications, though not recommended.

    F.e. qdisc handles always have minor number equal to zero,
    classes (or flows) have major equal to parent qdisc major, and
    minor uniquely identifying class inside qdisc.

    Macros to manipulate handles:
 */

#define TC_H_MAJ_MASK (0xFFFF0000U)
#define TC_H_MIN_MASK (0x0000FFFFU)
#define TC_H_MAJ(h) ((h)&TC_H_MAJ_MASK)
#define TC_H_MIN(h) ((h)&TC_H_MIN_MASK)
#define TC_H_MAKE(maj,min) (((maj)&TC_H_MAJ_MASK)|((min)&TC_H_MIN_MASK))

#define TC_H_UNSPEC     (0U)
#define TC_H_ROOT       (0xFFFFFFFFU)
#define TC_H_INGRESS    (0xFFFFFFF1U)

inside include/linux/pkt_sched.h (linux 2.4.19 kernel tree).
It seems that you can set FFFF class ids as stated by the minor mask.
Hope to be right,

Marcello

Il mar, 2002-12-17 alle 12:16, Raymond Leach ha scritto:
> Hi all
> 
> Does anyone know of a limit to the number of filters or classes that can
> be attached to a single qdisc (let's say CBQ or HTB)?
> 
> I have a client that want to do bandwidth throttling per ip across 10
> class C subnets.
> 
> What problems can I expect, and does anyone have any other suggestions
> on how to accomplish this?
> 
> Ray
-- 
Marcello Scacchetti <marcello.scacchetti@nextrem.it>

