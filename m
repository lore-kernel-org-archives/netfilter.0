From: "Shazad Malik" <smalik@vistawiz.com>
Subject: ip_conntrack: table full, dropping packet. - Anyone????? Frustrating!
Date: Sun, 2 Jun 2002 23:25:31 -0400 (EDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <2781.24.168.132.35.1023074731.squirrel@mail.vistawiz.com>
Reply-To: smalik@vistawiz.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hello everyone -

I have thoroughly searched the internet for this error message which keeps
getting prompted in my logs and drops packets.  I just cant figure out why
this problem is occuring.  Initially, I thought it was my IPSEC connections
which were the culprit but that is not true.

I have seen other explanations such as incresing your tcp max number as
your physical mem. increase.  Check you /proc/net/ip_conntrack file for the
current connections.  But none of these factors have anything to do with
this error.  I have only 2 connections, doing regular HTTP gets and its
filling my log file:


Jun  2 09:50:39 new kernel: ip_conntrack: table full, dropping packet.
Jun  2 09:53:29 new kernel: ip_conntrack: table full, dropping packet.
Jun  2 09:57:14 new kernel: ip_conntrack: table full, dropping packet.

-- 
Shazad Malik
work: (845)623-2161
fax: (845) 623-1154



