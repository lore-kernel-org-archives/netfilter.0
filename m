From: "Ed Street" <blacknet@simplyaquatics.com>
Subject: RE: Strange log entry ...
Date: Mon, 8 Jul 2002 10:07:36 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <002d01c22688$cfa8a920$0a01a8c0@ed>
References: <1026137236.27155.71.camel@rayw>
Reply-To: <blacknet@simplyaquatics.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <1026137236.27155.71.camel@rayw>
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
To: 'Raymond Leach' <raymondl@knowledgefactory.co.za>, netfilter@lists.samba.org

Hello,


Looks like station 10.0.0.19 on eth2 tried to ping 199.181.167.201 and
it was droped.

Ed

-----Original Message-----
From: netfilter-admin@lists.samba.org
[mailto:netfilter-admin@lists.samba.org] On Behalf Of Raymond Leach
Sent: Monday, July 08, 2002 10:07 AM
To: netfilter@lists.samba.org
Subject: Strange log entry ...

Hi

Can anyone tell me what this is?

Jul  8 16:04:23 firefly kernel: DROP FORWARD INTERNAL: IN=eth2 OUT=eth0
SRC=10.0.0.19 DST=199.181.167.201 LEN=1044 TOS=0x00 PREC=0x00 TTL=254
ID=18763 DF PROTO=ICMP TYPE=0 CODE=0 ID=6666 SEQ=0
Jul  8 16:04:26 firefly kernel: DROP FORWARD INTERNAL: IN=eth2 OUT=eth0
SRC=10.0.0.19 DST=199.181.167.201 LEN=1044 TOS=0x00 PREC=0x00 TTL=254
ID=18764 DF PROTO=ICMP TYPE=0 CODE=0 ID=6666 SEQ=0

I do not allow incoming echo requests to this machine. How the echo
reply is generated beats me ...

Ray




