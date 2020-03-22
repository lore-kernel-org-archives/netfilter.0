From: Darius <dram@mailbox.org>
Subject: TCP and UDP dport in the same rule
Date: Sun, 22 Mar 2020 14:40:26 +0100 (CET)
Message-ID: <670198645.21727.1584884428183@ox89.mailbox.org>
Reply-To: Darius <dram@mailbox.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; 
        boundary="----=_Part_21726_1664044971.1584884428182"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
        content-type:content-type:mime-version:subject:subject
        :message-id:reply-to:from:from:date:date:received; s=
        mail20150812; t=1584884428; bh=LIaUPu91s78K+KsSNJEm9ra7C7+T3PG4d
        DGJiW5OfNw=; b=Da32w50S5L4Om/9OpYprI55Soc3V3KJpIUmkCF+1c/EdFASgR
        Qs/zf3WSS2T16QVbTuNCTuLMnov/vZc89x/JmuhX5eVEpqYWw9m0sNHTaPTBRa9a
        ZThiNENXiH7ijV7ufozdmn34HD1ttojNb+GL8mV1OX7yP68KTiB18IPEef5YsKCi
        oBNF9va6G3Udxw+kZ9idkFV6bnjErb6i/81IMM3fppU/ebLK9IseI0DPqoSGS9H7
        z4NHAs9GqsMQZoE57qcwxkraFNyv+76ImHhj8Wtcp/lHYz3goj1FmtEBYmIuK3Im
        qsKAARcgEl4yLX4djd2FHSL/x2MCwz3LvdAkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1584884428; h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:mime-version:mime-version:
         content-type:content-type; bh=LIaUPu91s78K+KsSNJEm9ra7C7+T3PG4dDGJiW5OfNw=;
        b=fX7oY0oAIzaVcE6MZ4zHN+eWWEh2vwBJGgl8CJd4ocqJIdmmnTvvpNAX9b0DeBKrRcqUtY
        rSSP/LRYvW4WWQUmBpeR8do8OBWLJSKx4590/A4PUKy4xgciBAOOZPMIuAdcy1vt5LZkV1
        rgKc+nDRGvguCaMKsv7wl4/9F54o6TsvBcbN20Pi/0VaZwTQlRxvSo+1yzkamHnOcxFYMh
        bLYutOw6BpVRjvjym0Wa6ox61A8uMUy1C4zpkSjIMuoEr0zeiBfKk+A1WwaGFkZRFst1GF
        PmTNm4g6+oXbvQ8M+Zwr/jJDzg1khgPlMbODHMqrFg6imbhI1hVivYfpynL+EA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

------=_Part_21726_1664044971.1584884428182
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,
I can't find the way to make one rule matching packets with the same dport either on tcp or udp. So far I have rules like this:

ip protocol tcp tcp dport 2000 counter accept
ip protocol udp udp dport 2000 counter accept

I would like to have one rule instead. I couldn't find the way to do it with intervals or maps because dport statement must go together with tcp or udp.

Regards.

------=_Part_21726_1664044971.1584884428182
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: BCPG v1.61

iQEcBAABCgAGBQJed2rMAAoJEMHklCRhw9WaelgIALYvnCZW7bwzst57Vbd59qZy
zSPKCwTNO9eNUYMiC0uChMTO0plcRr3e+CVSLXrn5VcJUkjNBt9l8IKE6hWBB1CG
ZtcZAU083u+Ar42E5TDDZaD5whVnC30zQ2WOTdptXhHEjdXbI46984WhVl5DVGXy
2tyXuz1aeSMaKBb1cvhJJis+gs4pXQjFI7/8eQ4SsCHslfKGZIU3jn9pdr5P7dMj
Pv49U239dIZeGm8+sgpb42Jfhnu1DbcH2fp14OQnIpBXbFrpUaoP3qE8E+2H5m7f
bQv+Dkg7U1WFVUOPjhNfF/z0Cv2X4dhcA9fQTFQrBIuwGojTqDrALHlXmuOAIsw=
=h5Yq
-----END PGP SIGNATURE-----

------=_Part_21726_1664044971.1584884428182--
