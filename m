From: Alessandro Vesely <vesely@tana.it>
Subject: Links to projects using netfilter
Date: Fri, 26 Dec 2008 15:48:07 +0100
Message-ID: <4954EEA7.7000302@tana.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org, webmaster@netfilter.org

Hi all!

The NFQUEUE target is documented as "passing packets to userspace". 
However, I couldn't find a list of programs that can be used for this 
purpose on netfilter.org. Thus, I had to roll my own one (I'm now 
running my first alpha release.)

Would it make sense to add projects using the QUEUE mechanism to, say, 
http://www.netfilter.org/links.html? IPQ BDB maps an IP Queue to a 
Berkeley DB indexed on the ipv4 field. More at 
https://savannah.nongnu.org/projects/ipqbdb/

Ciao
Ale
