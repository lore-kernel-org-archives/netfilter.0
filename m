From: Geoffrey Said <geoffrey.said@gmail.com>
Subject: Nf_nat_range structure flags oring not working.
Date: Fri, 10 Jul 2015 14:47:06 +0200
Message-ID: <CAPnTfuTk+9dCPbCvkv5DuxW_Ly=0Tp66PQXPRtcqVVWajqzn6Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=XPEHaqyOoAhYUmd2Avj5dNtsiRE30lh7JIiyHi560ig=;
        b=cTSCytADXrrUmSZ2YlyFw2m47Z7NxsJUzIQ1X3KQa6po6XDLmoiJs5fDcTMY00hKoQ
         5Q1nYDb8SvWuQuRhlEiOqbyvPFxjWyio/OO0I6ZNnE+5SA6MmZiEHym1pWzPO2ANt33V
         UXH+HbMCeDeiaakTikOydiiTfubCRUWrWhrKVl2VN6zGK7AK+1TNbs0IC0x93FNfP4e+
         fx/6KXL13Z0iPJZT4QwDxHVyuTssxVaV/FPgu4o8/szpxNn+t15WnjloUgw8N49+fDWH
         faJSBTrKo3E0BMyr6s/hRxadBurfPZ8ZEOzT2KKC2l4jPui0+4bsjH7hQxrS6kG/Ejqo
         vSow==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I am currently writing a Netfilter module to use the NAT sub-system to
route UDP packets to a specific destination contained in the packet
itself.

After parsing the packet and retrieving the IP, I am creating a
nf_nat_range structure and setting the min_proto and min_addr
structures.

Then I am oring the NF_NAT_RANGE_MAP_IPS and the NF_NAT_RANGE_PROTO_SPECIFIED.

After the structure has been properly configured I am calling the
nf_nat_setup_info function and passing it the ct, the nf_nat_range
structure, and NF_NAT_MANIP_DST.

The issu is that the oring is not working.  If the flags parameter is
not assigned directly to the NF_NAT_RANGE_MAP_IPS the packet is not
natted and forwarded to the destination.

I cannot work out why this is happening.  My ultimate aim is to be
able to nat the packet to a different IP and port.

Thanks
Geoffrey
