From: "Alexis" <alexis@tpys.com.ar>
Subject: RE: Poll on large sites that deploy Iptables.
Date: Fri, 4 Jun 2004 13:49:33 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1BWHw7-00035m-0m@vishnu.netfilter.org>
References: <7C9884991ADAE0479C14F10C858BCDF591E32F@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF591E32F@alderaan.smgtec.com>
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
To: 'Daniel Chemko' <dchemko@smgtec.com>
Cc: netfilter@lists.netfilter.org

Yes, its true but you must isolate 2 concepts here.

PIX doesnt run IOS, it uses a software called pix software (yes, cisco has a
lot of art naming devices). All pixes mid to high range(515E, 525 and 535)
are intel pentium based and in standard configuration they do the encryption
in the main cpu.

Now they made (cisco) a new VAC (VPN accelerator card) that the routers /
switches+routers (like 6500's) and pixes uses to do the encryption via
hardware (those chips are not intel based).

So, PIX uses main x86 proccessors to do the encryption job if there isnt any
VAC installed, in this case all the encryption proccess are passed to the
VAC. It works in the same way in some routers not all.

I hope it helps.

 

-----Mensaje original-----
De: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] En nombre de Daniel Chemko
Enviado el: Viernes, 04 de Junio de 2004 13:40
Para: Aldo Lagana; Brett Simpson; netfilter@lists.netfilter.org
Asunto: RE: Poll on large sites that deploy Iptables.

Aldo Lagana wrote:
> First off - like AOL, IBM, etc - all use high-end probably cisco 
> routers which do their firewalling - one cannot get the packet per 
> second throughput they need without dedicated ASIC-based 
> router/firewalls...

Correct me if I'm wrong, but aren't (at least mid-sized) CISCO firewalls
based on X86's down to the PCI bus and Pentium derived processors? Even
Mid-grade routers are supplying VPN accelerator chips, but I think the
firewall code itself is stored in flash, executed like any other programs. I
doubt IOS uses a lot of hardware acceleration beyond the CPU. Although I
really don't know much since I haven't done much work on them.

An example:
(http://www.cisco.com/en/US/products/hw/vpndevc/ps2030/products_qanda_it
em09186a0080091b17.shtml)
Even the 535's only use PIII 1ghz



