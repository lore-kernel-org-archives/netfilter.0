From: Alexey Talikov <alexey_talikov@texlab.com.uz>
Subject: Re[2]: reset /proc/net/dev
Date: Fri, 13 Sep 2002 14:45:08 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5421706552.20020913144508@texlab.com.uz>
References: <Pine.LNX.4.44.0209121538280.16753-100000@SGI.rdscv.ro>
Reply-To: Alexey Talikov <alexey_talikov@texlab.com.uz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0209121538280.16753-100000@SGI.rdscv.ro>
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
To: Ionut Spirlea <ionuts@SGI.rdscv.ro>
Cc: netfilter@lists.netfilter.org

Hello Ionut,

Thursday, September 12, 2002, 5:46:29 PM, you wrote:
IS> # insmod c_dev.o
IS> # rmod c_dev

It reset all interfaces eth ppp ...
May be you can add options for this module
F.E.
insmod c_dev.o eth1
insmod c_dev.o ppp12

-----------------------------------
mailto:alexey_talikov@texlab.com.uz
BR
Alexey Talikov
FORTEK
-----------------------------------


