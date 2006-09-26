From: Martin Feinstein <feinstei@email.unc.edu>
Subject: IPTABLES INVALID state
Date: Tue, 26 Sep 2006 17:10:21 -0400 (EDT)
Message-ID: <Pine.A41.4.63+UNC.0609261708310.57350@login2.isis.unc.edu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


  Hi,
  We're running an EZproxy server  under RHEL4. We've recently had problems
  downloading a PDF file from one of our vendor sites. The symptom is that the
  download eventually times out part way through and the PDF reader claims that
  the file format is bad.

  After a repeated examination of our proxy server, we decided to turn off
  IPTABLES as a test and the transfer worked.

  Since that time, I've used SNORT to examine the incoming packets for both the
  successful (IPTABLES off) and unsuccessful attempts (IPTABLES on).
  In the unsuccessful case, after receiving about 70% of the file, an
  abnormally long time elapses and we receive the same packet several times and
  finally send the sender ACK FIN.

  In desparation, I inserted an IPTABLES command to accept INVALID packets from
  the vendor server. The transaction completed normally.

  I then turned on the logging function in IPTABLES for the INVALID records and
  also ran SNORT against the whole transaction so that using the ID numbers in
  the snort log and the log of the INVALID packets, I could see the entire
  INVALID packet.

  My problem is that I can't figure out why IPTABLES sees them as invalid. All
  the records in the IPTABLES log have good source/destination ports, good flag
  configurations (A and AP), good window sizes etc. When I look at the data
  packet in the SNORT log, there doesn't seem to be anything unusual.

  In his HOWTO, Rusty defines an invalid packet as one that could not be
  identified for reasons that include running out of memory. Is that a
  possibility here? Are there other possibilities?

  The IPTABLES directive I'm using doesn't work for me as a long term solution.
  I'm accepting INVALID records from a specific IP source that could change at
  any time. Is it possible that the IPTABLES rule may be a little too strict?

  Many thanks...martin feinstein
               Library Systems
               University of North Carolina Chapel Hill




