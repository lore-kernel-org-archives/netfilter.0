From: Alexey Talikov <alexey_talikov@texlab.com.uz>
Subject: Re[2]: [LARTC] Egress shaping over multiple interfaces?
Date: Fri, 1 Nov 2002 08:52:10 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <9587912972.20021101085210@texlab.com.uz>
References: <200210311520.58059.mklingens@ism.nl>
 <200210311733.12958.mklingens@ism.nl> <200210311800.52588.stef.coene@docum.org>
 <200210311945.05157.hasso@linux.ee>
Reply-To: Alexey Talikov <alexey_talikov@texlab.com.uz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200210311945.05157.hasso@linux.ee>
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
To: Hasso Tepper <hasso@linux.ee>
Cc: netfilter@lists, netfilter@lists.netfilter.org

Hello Hasso,

Thursday, October 31, 2002, 10:45:05 PM, you wrote:

HT> IMQ? I'm using it in the production. 100 IMQ devices 10 - 50 of them 
HT> in use. Number of devices in use is changing in boxes and I had to 
HT> create just enough IMQ devices. I'm using IMQ in combination with TBF 
HT> to get bidirectional shaping. No problems at all.

As I know max number of imq devices 16
i.e.
modprobe imq numdevs=16
Do you change this line in inclue/linux/imq.h

#define IMQ_MAX_DEVS   16

-----------------------------------
mailto:alexey_talikov@texlab.com.uz
BR
Alexey Talikov
FORTEK
-----------------------------------


