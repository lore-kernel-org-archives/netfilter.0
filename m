From: "Farmer, Joseph - DFI" <Joseph.Farmer@dfi.state.wi.us>
Subject: Fedora and Recent Module
Date: Thu, 16 Oct 2003 10:08:03 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <35A63C29D445834BA42FE172EC30EB3C189ED8@dfiemlp1.dfi.state.wi.us>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

     The three beta releases of Fedora core (distribution formerly known as
Redhat) have 
had a problem with the recent module.  They ship with 1.2.8 but attempting
to load the 
recent module results in an error message because it cannot load
libipt_recent.so.  
Is there a way to patch the iptables that ships with Fedora so recent works?
Could 
I just drop this file from Mandrake's 1.2.8 in the appropriate directory?
Will the 
"patch-o-matic" system do this and, if so, is there a FAQ on how to do this?
     Sorry for the noise.  I've trolled the list archives and didn't see
this mentioned.
Bug has been filed against Fedora.

Thanks. 

