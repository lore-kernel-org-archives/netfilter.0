From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Can't use iptables -m string with any RedHat distri
Date: Tue, 3 Jun 2003 15:44:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030603154401.7091b39e.arnt@c2i.net>
References: <7C9884991ADAE0479C14F10C858BCDF5122DCC@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF5122DCC@alderaan.smgtec.com>
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

On Mon, 2 Jun 2003 17:36:36 -0700, 
"Daniel Chemko" <dchemko@smgtec.com> wrote in message 
<7C9884991ADAE0479C14F10C858BCDF5122DCC@alderaan.smgtec.com>:

> cd /usr/src/linux-<kernelversion>
> make menuconfig
> Do your business adding Networking -> Netfilter -> Modules into the
> netfilter config. I KNOW that modules work, so compile all the patch
> added netfilter options as modules.
> Make dep; make bzImage; etc...
> Install the new kernel

..a better approach is 'make dep modules modules_install install', 
which drops everything home, automagically, on Red Hat 7.3 and up.

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.




