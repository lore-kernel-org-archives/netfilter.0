From: Dan Graham <graham@molbio.uoregon.edu>
Subject: EtherTalk Packet Filtering
Date: Mon, 14 Apr 2003 17:04:13 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0304141655390.11005-100000@molbio.uoregon.edu>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello;
  I'm new to the list, and I'm new to netfilter. I've just set up a
Bridge+IPtables firewall, and it seems to be working well, with one
exception.  The bridge is passing EtherTalk packets, when I'd my default
FORWARD policy is DROP.  So the question is , did I miss a
configuration option which would allow dropping of non-IP packets?

 I'm willing to start adding non-IP filtering, but I'd rather not
duplicate previous work.

graham@molbio.uoregon.edu

541-346-5079 (voice)
541-346-4854 (FAX)

Institute of Molecular Biology
1229 University of Oregon
Eugene, OR 97403-1229



