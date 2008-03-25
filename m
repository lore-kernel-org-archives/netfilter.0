From: william fitzgerald <wfitzgerald@tssg.org>
Subject: Query: Can Netfilter inspect xml soap traffic
Date: Tue, 25 Mar 2008 15:01:10 +0000
Message-ID: <47E913B6.4080004@tssg.org>
Reply-To: wfitzgerald@tssg.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Dear Netfilter Experts,

Can Netfilter/iptables inspect xml/soap messages as xml based firewalls do?

Does the Layer-7 module have enough "smarts" to inspect web service 
messages.

I am asking in regard to the role of Network Access Control firewalls 
such as iptables within a dedicated enterprise web service SOA environment.

I have seen some posts that suggest that firewalls are now obsolete, 
particularly NACs, in regard to web services (everything is over http 
hence less effect restrictions).

However, my opinion is that its not as simple as opening ports 80 and 
443 to tunnel SOAP messages.

For example, I may want to restrict IP ranges, maybe I have some 
business partners and I only want them accessing the web service. Or 
maybe I need to control DoS attacks to web services.

I think if iptables has also the ability to deep packet inspect xml 
messages it then demonstrates that there is still an importance for NAC 
based firewalls.

All pointers to documentation and your comments are welcome.

I look forward to your support,
regards,
Will.

-- 
William M. Fitzgerald,
PhD Student,
Telecommunications Software & Systems Group,
ArcLabs Research and Innovation Centre,
Waterford Institute of Technology,
WIT West Campus,
Carriganore,
Waterford.
Office Ph: +353 51 302937
Mobile Ph: +353 87 9527083
Web: www.williamfitzgerald.org
      www.linkedin.com/in/williamfitzgerald
      www.ryze.com/go/wfitzgerald



