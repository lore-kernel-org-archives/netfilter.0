From: "Administrador de Red" <admin@gecyt.cu>
Subject: i has a problem with the kernel 2.4.19 and 2.4.20 and iptable
Date: Sat, 14 Dec 2002 12:47:51 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <web-290033@gecyt.cu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: netfilter@lists.netfilter.org

Hi friends
Today I install the kernel 2.4.20 for linux red hat, and 
when i want to finish, i execute /etc/rc.d/init.d/iptables 
status, for see the status of iptables, bu what sorprase!! 
the iptables showing me the next error.

well at the end because at the begin it is show the 
parameters normal(table).

tabla:mangle
iptables :libptc/libip4tc.c:384 do check assertion h->info 
valid-hooks==(1<< 0  1<<3) failed

/etc/rc.d/init.d/iptables line 170: 955 abortado(abort)
iptables -t mangle --list

the when i go to the start or stop the iptables show the 
following error

modprobe can't locate module iptables
iptable v1.2.3 can't initialize iptables mangle 
table does not exist do you need to insmod?
perhpas iptables or you kernel need to be upgraded?

someone  can I help me?.
I fell very bad for this.

sincerely Thomas









Estamos en Calle 20 Numero 4110 % 41 y 47,
Miramar, Playa, Ciudad Habana, Cuba.
Telf:537(203-01-60) y (202-79-20)
Fax: 537(204-96-64)
Visitenos en: http://www.gecyt.cu

