From: Illes Marton <illes@c3.hu>
Subject: u32 pom errors
Date: Wed, 30 Jul 2003 05:41:40 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030730034140.GA867@c3.hu>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="OXfL5xGRrasGEqWY"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline

Hi,

I tried to post it once, but got lost. :(

In the POM the u32 match misses some files:
u32.patch.config.in
u32.patch.configure.help
u32.patch.makefile

Please find them attached

Marton

-- 

--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: attachment; filename="u32.patch.config.in"

  dep_tristate '  LENGTH match support' CONFIG_IP_NF_MATCH_LENGTH $CONFIG_IP_NF_IPTABLES
  dep_tristate '  U32 match support' CONFIG_IP_NF_MATCH_U32 $CONFIG_IP_NF_U32

--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: attachment; filename="u32.patch.configure.help"

CONFIG_IP_NF_MATCH_LENGTH
U32 patch support
CONFIG_IP_NF_MATCH_U32
  U32 allows you to extract quantities of up to 4 bytes from a packet,
  AND them with specified masks, shift them by specified amounts and
  test whether the results are in any of a set of specified ranges.
  The specification of what to extract is general enough to skip over
  headers with lengths stored in the packet, as in IP or TCP header
  lengths.

  Details and examples are in the kernel module source.


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: attachment; filename="u32.patch.makefile"

obj-$(CONFIG_IP_NF_MATCH_LENGTH) += ipt_length.o

obj-$(CONFIG_IP_NF_MATCH_U32) += ipt_u32.o


--OXfL5xGRrasGEqWY--

