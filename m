From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: ip_alwas_defrag kernel parameter
Date: Tue, 27 Apr 2004 20:20:47 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404280320.i3S3Kn2v026832@server5.bandwidthco.com>
References: <31683.1083053841@zworg.com>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <31683.1083053841@zworg.com>
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
To: '__ Radien__' <radien@zworg.com>, netfilter@lists.netfilter.org

 

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of __ Radien__
Sent: Tuesday, April 27, 2004 1:17 AM
To: netfilter@lists.netfilter.org
Subject: ip_alwas_defrag kernel parameter

Dear All

   Does kernel, newer than 2.4.*, defrags fragmented packets?
   I cant find ip_always_defrag in RH 9.0, so I think it should do it by
default.
   Am I right?

Regards
__Radien__

If you are using connection tracking, fragmented packets are (must be)
reassembled by default in order for connection tracking to effectively
function as designed. So, yes you are correct.



