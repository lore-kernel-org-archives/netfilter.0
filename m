From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: Just before I proceed
Date: Thu, 12 Sep 2002 11:52:18 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0209121150420.25433-100000@dns.toxicfilms.tv>
References: <3D7F28CD.DBF9D2C9@sympatico.ca>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3D7F28CD.DBF9D2C9@sympatico.ca>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jimmy James <jamesstickland@sympatico.ca>
Cc: netfilter@lists.netfilter.org

> 1. Download 2.4.19 tape of source to /usr/src
> 2. tar -vxf *2.4.19*.tar .
> 3. Go do the directory of rusty's p-o-m
> 4. Begin patching the kernel
> 5. Decompress, compile, install latest iptables
> 6.  Make a new kernel suitable for router
>
> I am quite sure this is what i must do, but i do not wish for any screw
> ups.  Thanks.
Precisely. Compile all netfilter options as modules, so you can add
options to them like
# modprobe ip_nat_ftp ports=21,2121
or simply to load/reload/unload them.

Regards,
Maciej Soltysiak


