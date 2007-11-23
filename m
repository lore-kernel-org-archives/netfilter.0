From: Michael Rash <mbr@cipherdyne.org>
Subject: fwsnort-1.0.3 released
Date: Fri, 23 Nov 2007 13:49:33 -0500
Message-ID: <20071123184933.GC32526@minastirith>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

    fwsnort translates Snort rules into equivalent iptables rules.
By using the Netfilter string match extension, iptables can detect a
significant percentage of Snort rules that are designed to detect
everything from malware to SQL injection attacks.

The fwsnort-1.0.3 release can be downloaded here:

http://www.cipherdyne.org/fwsnort/download/

Here are the changes:

- Added --include-re-caseless and --exclude-re-caseless options to
  have --include-regex and --exclude-regex options match case insensitively.
- Major signature update from Bleeding Threats. This update includes a
  large number of new signatures with PCRE statements, with an emphasis on
  detecting SQL injection attacks directed at internal webservers from
  external sources.
- Added the ability to interpret PCRE statements that include simple string
  matches separated by ".*" and ".+" as multiple iptables string
  matches. The only negative consequence in terms of signature detection
  is that ordering is not preserved; that is, the PCRE "/UNION.+SELECT/"
  would only match a packet that contains "UNION" followed by "SELECT",
  whereas an iptables rule that uses a string match for UNION and a
  separate string match for SELECT would match a packet that contains both
  strings but in reverse. Typically this is not a huge concern, and the
  PCRE translation can be disabled with a new option --no-pcre.
- Added asn1 keyword to unsupported list.


--
Michael Rash
http://www.cipherdyne.org/
Key fingerprint = 53EA 13EA 472E 3771 894F  AC69 95D8 5D6B A742 839F
